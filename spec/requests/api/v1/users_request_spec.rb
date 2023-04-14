require 'rails_helper'

describe 'User API' do
  before :each do
    @user = create(:user)
  end
    describe '#index' do
    it 'returns all users' do
      get '/api/v1/users'

      expect(response).to be_successful
      users = JSON.parse(response.body, symbolize_names: true)
      expect(users[:data].count).to eq(1)
      expect(users[:data][0][:attributes][:email]).to eq(@user.email)
      expect(users[:data][0][:attributes]).to have_key(:email)
      expect(users[:data][0][:attributes]).to have_key(:name)
      expect(users[:data][0][:attributes]).to have_key(:intolerances)
    end
  end

  describe '#show' do
    it 'returns a user' do
      get "/api/v1/users/#{@user.id}"

      expect(response).to be_successful
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:email]).to eq(@user.email)
      expect(user[:data][:attributes][:name]).to eq(@user.name)
      expect(user[:data][:attributes][:intolerances]).to eq(@user.intolerances)
    end

    it 'returns a 404 if user not found' do
      get "/api/v1/users/100"

      error = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(error[:errors][0][:title]).to eq('Couldn\'t find User with \'id\'=100')
    end
  end

  describe '#create' do
    it 'creates a user' do
      user_params = { email: 'jimbo@jumbo.com', google_id: '1234567890', name: 'jimbo', intolerances: 'dairy, gluten' }
      
      post '/api/v1/users', params: user_params

      expect(response).to be_successful
      expect(User.count).to eq(2)
    end

    it 'returns a 400 if user not created due to missing params' do
      user_params = { google_id: '1234567890', name: 'jimbo', intolerances: 'dairy, gluten' }
      post '/api/v1/users', params: user_params

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(error[:errors][0][:title]).to eq("Validation failed: Email can't be blank")
    end

    it 'returns a 404 user email/id already exist' do
      user2 = { email: @user.email, google_id: @user.google_id, name: 'billybob' }
      post '/api/v1/users', params: user2

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(error[:errors][0][:title]).to eq("Validation failed: Email has already been taken, Google has already been taken")
    end
  end
  
  describe '#update' do
    it 'updates a user' do
      user_params = { dietary_restrictions: 'vegan' }
      
      patch "/api/v1/users/#{@user.id}", params: user_params
      
      expect(response).to be_successful
      user = JSON.parse(response.body, symbolize_names: true)
      expect(user[:data][:attributes][:dietary_restrictions]).to eq(user_params[:dietary_restrictions])
    end

    it 'can remove a dietary restriction' do
      user_2 = create(:user, email: 'jimbo@jumbo.com', google_id: '1234567890', name: 'jimbo', intolerances: 'dairy, gluten', dietary_restrictions: 'vegan' )
      user_params = { dietary_restrictions: nil }
      patch "/api/v1/users/#{user_2.id}", params: user_params

      expect(response).to be_successful
      user = JSON.parse(response.body, symbolize_names: true)
      
      expect(user[:data][:attributes][:dietary_restrictions]).to eq(nil)
    end
  end

  describe '#destroy' do
    it 'deletes a user' do
      delete "/api/v1/users/#{@user.id}"

      expect(response).to be_successful
      expect(User.count).to eq(0)
    end

    it 'returns a 404 if user not found' do
      delete "/api/v1/users/100"

      expect(response.status).to eq(404)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:errors][0][:title]).to eq('Couldn\'t find User with \'id\'=100')
    end
  end
end