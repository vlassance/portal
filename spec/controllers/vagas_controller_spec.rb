require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VagasController do

  # This should return the minimal set of attributes required to create a valid
  # Vaga. As you add validations to Vaga, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "nome" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VagasController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all vagas as @vagas" do
      vaga = Vaga.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vagas).should eq([vaga])
    end
  end

  describe "GET show" do
    it "assigns the requested vaga as @vaga" do
      vaga = Vaga.create! valid_attributes
      get :show, {:id => vaga.to_param}, valid_session
      assigns(:vaga).should eq(vaga)
    end
  end

  describe "GET new" do
    it "assigns a new vaga as @vaga" do
      get :new, {}, valid_session
      assigns(:vaga).should be_a_new(Vaga)
    end
  end

  describe "GET edit" do
    it "assigns the requested vaga as @vaga" do
      vaga = Vaga.create! valid_attributes
      get :edit, {:id => vaga.to_param}, valid_session
      assigns(:vaga).should eq(vaga)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vaga" do
        expect {
          post :create, {:vaga => valid_attributes}, valid_session
        }.to change(Vaga, :count).by(1)
      end

      it "assigns a newly created vaga as @vaga" do
        post :create, {:vaga => valid_attributes}, valid_session
        assigns(:vaga).should be_a(Vaga)
        assigns(:vaga).should be_persisted
      end

      it "redirects to the created vaga" do
        post :create, {:vaga => valid_attributes}, valid_session
        response.should redirect_to(Vaga.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vaga as @vaga" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vaga.any_instance.stub(:save).and_return(false)
        post :create, {:vaga => { "nome" => "invalid value" }}, valid_session
        assigns(:vaga).should be_a_new(Vaga)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vaga.any_instance.stub(:save).and_return(false)
        post :create, {:vaga => { "nome" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vaga" do
        vaga = Vaga.create! valid_attributes
        # Assuming there are no other vagas in the database, this
        # specifies that the Vaga created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vaga.any_instance.should_receive(:update_attributes).with({ "nome" => "MyString" })
        put :update, {:id => vaga.to_param, :vaga => { "nome" => "MyString" }}, valid_session
      end

      it "assigns the requested vaga as @vaga" do
        vaga = Vaga.create! valid_attributes
        put :update, {:id => vaga.to_param, :vaga => valid_attributes}, valid_session
        assigns(:vaga).should eq(vaga)
      end

      it "redirects to the vaga" do
        vaga = Vaga.create! valid_attributes
        put :update, {:id => vaga.to_param, :vaga => valid_attributes}, valid_session
        response.should redirect_to(vaga)
      end
    end

    describe "with invalid params" do
      it "assigns the vaga as @vaga" do
        vaga = Vaga.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vaga.any_instance.stub(:save).and_return(false)
        put :update, {:id => vaga.to_param, :vaga => { "nome" => "invalid value" }}, valid_session
        assigns(:vaga).should eq(vaga)
      end

      it "re-renders the 'edit' template" do
        vaga = Vaga.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vaga.any_instance.stub(:save).and_return(false)
        put :update, {:id => vaga.to_param, :vaga => { "nome" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vaga" do
      vaga = Vaga.create! valid_attributes
      expect {
        delete :destroy, {:id => vaga.to_param}, valid_session
      }.to change(Vaga, :count).by(-1)
    end

    it "redirects to the vagas list" do
      vaga = Vaga.create! valid_attributes
      delete :destroy, {:id => vaga.to_param}, valid_session
      response.should redirect_to(vagas_url)
    end
  end

end
