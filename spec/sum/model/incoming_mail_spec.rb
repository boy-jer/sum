require File.expand_path("#{File.dirname(__FILE__)}/../../spec_helper")

describe IncomingMail do
  
  before(:all) do
    migrate_reset
    @user = create_valid_user
  end
  
  describe "valid" do
    describe "numbers only" do
      
      before(:all) do
        email = generate_email(
          :subject => "-11.11 -11 11.11",
          :body => "11 +11 +11.11"
        )
        @emails, @numbers = IncomingMail.receive(email)
        @total = @numbers.inject(0) { |sum, item| sum + item }
      end

      it 'should process the correct numbers' do
        @numbers.should == [ 11.11, 11.0, 11.11, 11.0, -11.0, -11.11 ]
      end
    end
    
    describe "non-number characters (reply email)" do

      before(:all) do
        email = generate_email(
          :subject => "-11.11a -11",
          :body => "+11a +11.11"
        )
        @emails, @numbers = IncomingMail.receive(email)
      end

      it 'should process the correct numbers' do
        @numbers.should == [ 11.11, -11 ]
      end
    end
    
    describe "emails in the subject and body" do
      
      before(:all) do
        email = generate_email(
          :subject => "win@sumapp.com",
          :body => "winton@sumapp.com"
        )
        @emails, @numbers = IncomingMail.receive(email)
      end

      it 'should process the correct emails' do
        @emails.should == [ "win@sumapp.com", "winton@sumapp.com" ]
      end
    end
    
    describe "start/stop" do
      
      before(:all) do
        email = generate_email(
          :subject => " start",
          :body => "stop"
        )
        @emails, @numbers, @start, @stop = IncomingMail.receive(email)
      end
      
      it 'should start' do
        @start.should == true
      end

      it 'should stop' do
        @stop.should == true
      end
    end
  end
  
  describe "invalid" do
    describe "no numbers, emails, starts, or stops" do
      
      before(:all) do
        email = generate_email(:body => "this is a test")
        @emails, @numbers, @start, @stop = IncomingMail.receive(email)
      end
    
      it 'should fail' do
        @numbers.should == []
        @emails.should == []
        @start.should == false
        @stop.should == false
      end
    end
    
    describe "no user" do
      
      before(:all) do
        email = generate_email(:from => "not@user.com", :subject => '1')
        @emails, @numbers = IncomingMail.receive(email)
      end
      
      it 'should fail' do
        @numbers.should == nil
        @emails.should == nil
      end
    end
  end
end
