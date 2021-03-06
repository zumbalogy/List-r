require 'spec_helper'
include Devise::TestHelpers


describe 'log in and stuff' do
    describe 'for making and loging in' do
        before do
            @bob = User.new
            @bob.email = 'sdf@example.com'
            @bob.password = 'password'
            @bob.save!
        end

        it 'can sign up' do
            visit user_session_path
            within "//div[@class = 'login']" do
                fill_in 'Email', :with => @bob.email
                fill_in 'Password', :with =>'password'
                click_button('submit')
            end
            page.should have_xpath('//table/thead')
        end

    end
end

