require 'test_helper'

class MonsterDropRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monster_drop_record = monster_drop_records(:one)
  end

  test "should get index" do
    get monster_drop_records_url
    assert_response :success
  end

  test "should get new" do
    get new_monster_drop_record_url
    assert_response :success
  end

  test "should create monster_drop_record" do
    assert_difference('MonsterDropRecord.count') do
      post monster_drop_records_url, params: { monster_drop_record: { count: @monster_drop_record.count } }
    end

    assert_redirected_to monster_drop_record_url(MonsterDropRecord.last)
  end

  test "should show monster_drop_record" do
    get monster_drop_record_url(@monster_drop_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_monster_drop_record_url(@monster_drop_record)
    assert_response :success
  end

  test "should update monster_drop_record" do
    patch monster_drop_record_url(@monster_drop_record), params: { monster_drop_record: { count: @monster_drop_record.count } }
    assert_redirected_to monster_drop_record_url(@monster_drop_record)
  end

  test "should destroy monster_drop_record" do
    assert_difference('MonsterDropRecord.count', -1) do
      delete monster_drop_record_url(@monster_drop_record)
    end

    assert_redirected_to monster_drop_records_url
  end
end
