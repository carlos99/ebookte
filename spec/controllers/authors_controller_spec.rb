require "spec_helper"

describe AuthorsController do
	describe "GET #index" do
		it "Assigns the authors object to @authors variable" do
			author1 = Fabricate(:author)
			author2 = Fabricate(:author)

		get :index
			expect(assigns(:authors)).to match_array([author1, author2])
		end

		it "Renders the index template" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe "GET #show" do
		let(:author) {Fabricate(:author) } #With this 
		it "finds the author with the given id and assigns to author variable" do
			#author = Fabricate(:author)

			get :show, id: author
			expect(assigns(:author)).to eq(author)
		end

		it "Renders the show template" do
			#author = Fabricate(:author)

			get :show, id: author
			expect(response).to render_template :show
		end
	end
end