module AuthenticationHelpers
  def sign_up(user)
  	fill_in "Name", with: user.name
  	fill_in "Email", with: user.email
  	fill_in "Password", with: user.password
  	fill_in "Password confirmation", with: user.password
  	click_button 'Sign up'
  end

  def sign_in(user)
  	fill_in "Email", with: user.email
  	fill_in "Password", with: user.password
  	click_button 'Sign in'
  end
end

World(AuthenticationHelpers)