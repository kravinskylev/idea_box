require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let!(:idea) { Idea.create(description: 'hats', category_id: 1, user_id: 1) }
  let!(:valid_attributes) {{ description: 'hats', category_id: 1, user_id: 1 }}
  let(:valid_session) { {} }

  it 'should have an index action' do
    get :index, {}, valid_session
    expect(response.code).to eq('200')
    expect(response).to render_template(:index)
    expect(assigns(:ideas)).to eq([idea])
  end

  it 'should have a show action' do
    get :show, {id: idea.to_param}, valid_session
    expect(assigns(:idea)).to eq(idea)
  end

  xit 'should have a delete action' do
  end

  it 'should have a new action' do
    get :new, {}, valid_session
    expect(assigns(:idea)).to be_a_new(Idea)
  end

  it 'should have a create action' do
    expect {
      post :create, {idea: valid_attributes}, valid_session
    }.to change(Idea, :count).by(1)
  end
end
