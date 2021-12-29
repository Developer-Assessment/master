require 'rails_helper'

describe 'POST /bookmarks' do
  # create a user before the test scenarios are run
  let!(:user) { User.create(username: 'soulchild', authentication_token: 'abcdef') }

  # pass the user username and authentication to the header
  scenario 'valid bookmark attributes' do
    post '/bookmarks', params: {
      bookmark: {
        url: 'https://rubyyagi.com',
        title: 'RubyYagi blog'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }
  # ...
  end

  # pass the user username and authentication to the header
  scenario 'invalid bookmark attributes' do
    post '/bookmarks', params: {
      bookmark: {
        url: '',
        title: 'RubyYagi blog'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }
  # ...
  end

  # scenario with unauthenticated user
  context 'unauthenticated user' do
    it 'should return forbidden error' do
      post '/bookmarks', params: {
        bookmark: {
          url: 'https://rubyyagi.com',
          title: 'RubyYagi blog'
        }
      }

      # response should have HTTP Status 403 Forbidden
      expect(response.status).to eq(403)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Invalid User')
    end
  end
end

describe 'PUT /bookmarks' do
  let!(:bookmark) { Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi') }

  # create a user before the test scenarios are run
  let!(:user) { User.create(username: 'soulchild', authentication_token: 'abcdef') }

  scenario 'valid bookmark attributes' do
    # send put request to /bookmarks/:id
    # pass the user username and authentication to the header
    put "/bookmarks/#{bookmark.id}", params: {
      bookmark: {
        url: 'https://fluffy.es',
        title: 'Fluffy'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }

    # ...
  end

  scenario 'invalid bookmark attributes' do
    # send put request to /bookmarks/:id
    # pass the user username and authentication to the header
    put "/bookmarks/#{bookmark.id}", params: {
      bookmark: {
        url: '',
        title: 'Fluffy'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }

    # ...
  end

  # scenario with unauthenticated user
  context 'unauthenticated user' do
    it 'should return forbidden error' do
      put "/bookmarks/#{bookmark.id}", params: {
        bookmark: {
          url: 'https://rubyyagi.com',
          title: 'RubyYagi blog'
        }
      }

      # response should have HTTP Status 403 Forbidden
      expect(response.status).to eq(403)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Invalid User')
    end
  end
end

describe 'GET /bookmarks' do
  # create a user before the test scenarios are run
  let!(:user) { User.create(username: 'soulchild', authentication_token: 'abcdef') }

  # pass the user username and authentication to the header
  scenario 'valid bookmark attributes' do
    get '/bookmarks', params: {
      bookmark: {
        url: 'https://rubyyagi.com',
        title: 'RubyYagi blog'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }
  # ...
  end

  # pass the user username and authentication to the header
  scenario 'invalid bookmark attributes' do
    get '/bookmarks', params: {
      bookmark: {
        url: '',
        title: 'RubyYagi blog'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }
  # ...
  end

  # scenario with unauthenticated user
  context 'unauthenticated user' do
    it 'should return forbidden error' do
      get '/bookmarks', params: {
        bookmark: {
          url: 'https://rubyyagi.com',
          title: 'RubyYagi blog'
        }
      }

      # response should have HTTP Status 403 Forbidden
      expect(response.status).to eq(403)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Invalid User')
    end
  end
end

describe 'GET /bookmarks' do
  let!(:bookmark) { Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi') }

  # create a user before the test scenarios are run
  let!(:user) { User.create(username: 'soulchild', authentication_token: 'abcdef') }

  scenario 'valid bookmark attributes' do
    # send get request to /bookmarks/:id
    # pass the user username and authentication to the header
    get "/bookmarks/#{bookmark.id}", params: {
      bookmark: {
        url: 'https://fluffy.es',
        title: 'Fluffy'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }

    # ...
  end

  scenario 'invalid bookmark attributes' do
    # send get request to /bookmarks/:id
    # pass the user username and authentication to the header
    get "/bookmarks/#{bookmark.id}", params: {
      bookmark: {
        url: '',
        title: 'Fluffy'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }

    # ...
  end

  # scenario with unauthenticated user
  context 'unauthenticated user' do
    it 'should return forbidden error' do
      get "/bookmarks/#{bookmark.id}", params: {
        bookmark: {
          url: 'https://rubyyagi.com',
          title: 'RubyYagi blog'
        }
      }

      # response should have HTTP Status 403 Forbidden
      expect(response.status).to eq(403)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Invalid User')
    end
  end
end

describe 'DELETE /bookmarks' do
  let!(:bookmark) { Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi') }

  # create a user before the test scenarios are run
  let!(:user) { User.create(username: 'soulchild', authentication_token: 'abcdef') }

  scenario 'valid bookmark attributes' do
    # send delete request to /bookmarks/:id
    # pass the user username and authentication to the header
    delete "/bookmarks/#{bookmark.id}", params: {
      bookmark: {
        url: 'https://fluffy.es',
        title: 'Fluffy'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }

    # ...
  end

  scenario 'invalid bookmark attributes' do
    # send delete request to /bookmarks/:id
    # pass the user username and authentication to the header
    delete "/bookmarks/#{bookmark.id}", params: {
      bookmark: {
        url: '',
        title: 'Fluffy'
      }
    }, headers: { 'X-Username': user.username, 'X-Token': user.authentication_token }

    # ...
  end

  # scenario with unauthenticated user
  context 'unauthenticated user' do
    it 'should return forbidden error' do
      delete "/bookmarks/#{bookmark.id}", params: {
        bookmark: {
          url: 'https://rubyyagi.com',
          title: 'RubyYagi blog'
        }
      }

      # response should have HTTP Status 403 Forbidden
      expect(response.status).to eq(403)
      
      # response contain error message
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:message]).to eq('Invalid User')
    end
  end
end
