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

	describe "GET #new" do
		it "Assigns a new  author object to the @author variable" do
			get :new
			expect(assigns(:author)).to be_instance_of(Author)
		end

		it "Renders the new template" do
			get :new
			expect(response).to render_template('new')
		end
	end

	describe "POST #create" do
		context "A successful create" do
			it "saves the new author object" do
			post :create, author: Fabricate.attributes_for(:author)
			expect(Author.count).to eq(1)
		end

		it "redict to the show action" do
			post :create, author: Fabricate.attributes_for(:author)
			expect(response).to redirect_to author_path(Author.first)
		end

		it "sets the success flash message" do
			post :create, author: Fabricate.attributes_for(:author)
			expect(flash[:success]).to eq('Author has been created successfully')
		end

		context "An Unsuccessful create" do
			it "Does not save the new author object with invalid inputs" do
				post :create, author: Fabricate.attributes_for(:author, first_name: nil)
				expect(Author.count).to eq(0)
			end

			it "Renders the new template" do
				post :create, author: Fabricate.attributes_for(:author, first_name: nil)
				expect(response).to render_template :new
			end

			it "sets the failure flash message" do
			post :create, author: Fabricate.attributes_for(:author, first_name: nil)
			expect(flash[:danger]).to eq('Author has not been created')
		end
		end
	end
end
end