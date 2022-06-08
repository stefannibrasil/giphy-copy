require 'rails_helper'

RSpec.describe "/users", type: :request do
  before do
    @user = create(:user)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get users_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get user_url(@user )
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_user_url(@user )
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      user_params = FactoryBot.attributes_for(:user)

      it "creates a new User" do
        expect {
          post users_url, params: { user: user_params }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post users_url, params: { user: user_params }
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    # context "with invalid parameters" do
    #   user_params = FactoryBot.attributes_for(:user, :invalid)

    #   it "does not create a new User" do
    #     expect {
    #       post users_url, params: { user: invalid_attributes }
    #     }.to change(User, :count).by(0)
    #   end

    #   it "renders a successful response (i.e. to display the 'new' template)" do
    #     post users_url, params: { user: invalid_attributes }
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      user_params = FactoryBot.attributes_for(:user)

      it "redirects to the user" do
        patch user_url(@user), params: { user: user_params }
        @user.reload
        expect(response).to redirect_to(user_url(@user))
      end
    end

    # context "with invalid parameters" do
    #   it "renders a successful response (i.e. to display the 'edit' template)" do
    #     patch user_url(@user), params: { user: invalid_attributes }
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      expect {
        delete user_url(@user)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete user_url(@user)
      expect(response).to redirect_to(users_url)
    end
  end
end
