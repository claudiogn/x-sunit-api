require 'test_helper'

class SurvivorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survivor = survivors(:one)
  end

  test "should get index" do
    get survivors_url, as: :json
    assert_response :success
  end

  test "should create survivor" do
    assert_difference('Survivor.count') do
      post survivors_url, params: { survivor: { abducted: @survivor.abducted, age: @survivor.age, flags: @survivor.flags, gender: @survivor.gender, latitude: @survivor.latitude, longitude: @survivor.longitude, name: @survivor.name } }, as: :json
    end

    assert_response 201
  end

  test "should show survivor" do
    get survivor_url(@survivor), as: :json
    assert_response :success
  end

  test "should update survivor" do
    patch survivor_url(@survivor), params: { survivor: { abducted: @survivor.abducted, age: @survivor.age, flags: @survivor.flags, gender: @survivor.gender, latitude: @survivor.latitude, longitude: @survivor.longitude, name: @survivor.name } }, as: :json
    assert_response 200
  end

  test "should destroy survivor" do
    assert_difference('Survivor.count', -1) do
      delete survivor_url(@survivor), as: :json
    end

    assert_response 204
  end
end
