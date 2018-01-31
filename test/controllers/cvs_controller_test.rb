require 'test_helper'

class CvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cv = cvs(:one)
  end

  test "should get index" do
    get cvs_url
    assert_response :success
  end

  test "should get new" do
    get new_cv_url
    assert_response :success
  end

  test "should create cv" do
    assert_difference('Cv.count') do
      post cvs_url, params: { cv: { age: @cv.age, children: @cv.children, current_address_L1: @cv.current_address_L1, current_address_L2: @cv.current_address_L2, current_city: @cv.current_city, current_country: @cv.current_country, first_name: @cv.first_name, height: @cv.height, last_name: @cv.last_name, marital_status: @cv.marital_status, middle_name: @cv.middle_name, nationality: @cv.nationality, phone_number: @cv.phone_number, skills: @cv.skills, user_id: @cv.user_id, visa_exp_date: @cv.visa_exp_date, weight: @cv.weight, work_visa: @cv.work_visa } }
    end

    assert_redirected_to cv_url(Cv.last)
  end

  test "should show cv" do
    get cv_url(@cv)
    assert_response :success
  end

  test "should get edit" do
    get edit_cv_url(@cv)
    assert_response :success
  end

  test "should update cv" do
    patch cv_url(@cv), params: { cv: { age: @cv.age, children: @cv.children, current_address_L1: @cv.current_address_L1, current_address_L2: @cv.current_address_L2, current_city: @cv.current_city, current_country: @cv.current_country, first_name: @cv.first_name, height: @cv.height, last_name: @cv.last_name, marital_status: @cv.marital_status, middle_name: @cv.middle_name, nationality: @cv.nationality, phone_number: @cv.phone_number, skills: @cv.skills, user_id: @cv.user_id, visa_exp_date: @cv.visa_exp_date, weight: @cv.weight, work_visa: @cv.work_visa } }
    assert_redirected_to cv_url(@cv)
  end

  test "should destroy cv" do
    assert_difference('Cv.count', -1) do
      delete cv_url(@cv)
    end

    assert_redirected_to cvs_url
  end
end
