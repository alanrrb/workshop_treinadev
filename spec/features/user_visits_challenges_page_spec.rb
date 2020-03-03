require 'rails_helper'

feature 'User visits challenges page' do
  scenario 'successfully' do
    login_as create(:user)
    challenge = create(:challenge)
    visit challenges_path
    expect(page).to have_content challenge.title
    expect(page).to have_content challenge.description
  end

  scenario 'multiple challeges' do
    login_as create(:user)
    challenges = []
    challenges << create(:challenge)
    challenges << create(:challenge, title: 'Outro Desafio',
                                    description: 'com outra descricao')
    visit challenges_path

    challenges.each do |challenge|
      expect(page).to have_content challenge.title
      expect(page).to have_content challenge.description
    end
  end
end
