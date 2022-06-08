require 'rails_helper'

RSpec.describe "/gifs", type: :request do
  before do
    @gif = create(:gif)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get gifs_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get gif_url(@gif)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_gif_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_gif_url(@gif)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      gif_params = FactoryBot.attributes_for(:gif)

      it "creates a new Gif" do
        expect {
          post gifs_url, params: { gif: gif_params }
        }.to change(Gif, :count).by(1)
      end

      it "redirects to the created gif" do
        post gifs_url, params: { gif: gif_params }
        expect(response).to redirect_to(gif_url(Gif.last))
      end
    end

    context "with invalid parameters" do
      gif_params = FactoryBot.attributes_for(:gif, :invalid_format)

      it "does not create a new Gif" do
        expect {
          post gifs_url, params: { gif: gif_params }
        }.to change(Gif, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post gifs_url, params: { gif: gif_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      gif_params = FactoryBot.attributes_for(:gif)

      it "redirects to the gif" do
        patch gif_url(@gif), params: { gif: gif_params }
        @gif.reload
        expect(response).to redirect_to(gif_url(@gif))
      end
    end

    context "with invalid parameters" do
      gif_params = FactoryBot.attributes_for(:gif, :invalid_format)

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch gif_url(@gif), params: { gif: gif_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested gif" do
      expect {
        delete gif_url(@gif)
      }.to change(Gif, :count).by(-1)
    end

    it "redirects to the gifs list" do
      delete gif_url(@gif)
      expect(response).to redirect_to(gifs_url)
    end
  end
end
