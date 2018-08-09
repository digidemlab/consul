require 'rails_helper'

feature 'Users' do

  context 'Regular authentication' do

    context 'Sign in' do

      scenario 'with short personal number' do
        create(:user, email: 'manuela@consul.dev', document_type: '1',
          document_number: '9305249170', password: 'judgementday')

        visit '/'
        click_link 'Sign in'
        fill_in 'user_login',    with: '9305249170'
        fill_in 'user_password', with: 'judgementday'
        click_button 'Enter'

        expect(page).to have_content 'You have been signed in successfully.'
      end

      scenario 'with long personal number' do
        create(:user, email: 'manuela@consul.dev', document_type: '1',
          document_number: '9305249170', password: 'judgementday')

        visit '/'
        click_link 'Sign in'
        fill_in 'user_login',    with: '199305249170'
        fill_in 'user_password', with: 'judgementday'
        click_button 'Enter'

        expect(page).to have_content 'You have been signed in successfully.'
      end

      scenario 'with long hyphenated personal number' do
        create(:user, email: 'manuela@consul.dev', document_type: '1',
          document_number: '9305249170', password: 'judgementday')

        visit '/'
        click_link 'Sign in'
        fill_in 'user_login',    with: '19930524-9170'
        fill_in 'user_password', with: 'judgementday'
        click_button 'Enter'

        expect(page).to have_content 'You have been signed in successfully.'
      end

      scenario 'with incomplete personal number' do
        create(:user, email: 'manuela@consul.dev', document_type: '1',
          document_number: '9305249170', password: 'judgementday')

        visit '/'
        click_link 'Sign in'
        fill_in 'user_login',    with: '930524917'
        fill_in 'user_password', with: 'judgementday'
        click_button 'Enter'

        expect(page).to have_content 'Invalid login or password'
      end

    end

  end

end
