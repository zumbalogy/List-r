require 'spec_helper'
include Devise::TestHelpers


describe 'make list' do
    describe 'given a logged in user' do
        before do
            @bob = User.new
            @bob.email = 'sdf@example.com'
            @bob.password = 'password'
            @bob.save!
            visit user_session_path
            within "//div[@class = 'login']" do
                fill_in 'Email', :with => @bob.email
                fill_in 'Password', :with =>'password'
                click_button('submit')
            end
        end

        it 'should be the index' do
            page.should have_xpath('//table/thead')
        end

        it 'can add a list' do
            fill_in('name', :with => 'spec_list')
            element = find_by_id('new_list')
            Capybara::RackTest::Form.new(page.driver, element.native).submit :name => nil

            page.should have_content 'spec_list'
        end

        it 'can go to a list' do
            fill_in('name', :with => 'spec_list')
            element = find_by_id('new_list')
            Capybara::RackTest::Form.new(page.driver, element.native).submit :name => nil

            click_link('spec_list')
            page.should have_content 'Seen'

        end





    end
end

