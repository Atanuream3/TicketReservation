require 'test_helper'

class BookingInfosControllerTest < ActionController::TestCase
  setup do
    @booking_info = booking_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_info" do
    assert_difference('BookingInfo.count') do
      post :create, booking_info: { Advance: @booking_info.Advance, No_Of_Tickets: @booking_info.No_Of_Tickets, Ticket_Type: @booking_info.Ticket_Type, User_Name: @booking_info.User_Name, email: @booking_info.email }
    end

    assert_redirected_to booking_info_path(assigns(:booking_info))
  end

  test "should show booking_info" do
    get :show, id: @booking_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_info
    assert_response :success
  end

  test "should update booking_info" do
    patch :update, id: @booking_info, booking_info: { Advance: @booking_info.Advance, No_Of_Tickets: @booking_info.No_Of_Tickets, Ticket_Type: @booking_info.Ticket_Type, User_Name: @booking_info.User_Name, email: @booking_info.email }
    assert_redirected_to booking_info_path(assigns(:booking_info))
  end

  test "should destroy booking_info" do
    assert_difference('BookingInfo.count', -1) do
      delete :destroy, id: @booking_info
    end

    assert_redirected_to booking_infos_path
  end
end
