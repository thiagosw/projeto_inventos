require 'test_helper'

class ProjetoTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    # @projeto = @user.projetos.build(name: "projetoname")
    # @projeto = @user.projetos.build(description: "Lorem ipsum")
    # @projeto = @user.projetos.build(bug: "Lorem ipsum")
    # This code is not idiomatically correct.
    @projeto = Projeto.new(name: "projetoname", description: "Lorem ipsum", bug: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @projeto.valid?
  end

  test "user id should be present" do
    @projeto.user_id = nil
    assert_not @projeto.valid?
  end

  test "name should be present" do
    @projeto.name = "   "
    assert_not @projeto.valid?
  end

  test "description should be present" do
    @projeto.description = "   "
    assert_not @projeto.valid?
  end

  test "description should be at most 140 characters" do
    @projeto.description = "a" * 141
    assert_not @projeto.valid?
  end

end
