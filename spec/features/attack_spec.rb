feature 'attack player two' do
  scenario 'attack player two' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'siba attacked Mittens'

  end
end
