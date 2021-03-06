require 'test_helper'

class Org::Panel::JobTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @org_panel_job_title = create org_panel_job_titles
  end

  test 'index ok' do
    get panel_job_titles_url
    assert_response :success
  end

  test 'new ok' do
    get new_panel_job_title_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('JobTitle.count') do
      post panel_job_titles_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_redirected_to org_panel_job_title_url(JobTitle.last)
  end

  test 'show ok' do
    get panel_job_title_url(@org_panel_job_title)
    assert_response :success
  end

  test 'edit ok' do
    get edit_panel_job_title_url(@org_panel_job_title)
    assert_response :success
  end

  test 'update ok' do
    patch panel_job_title_url(@org_panel_job_title), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_redirected_to org_panel_job_title_url(@#{singular_table_name})
  end

  test 'destroy ok' do
    assert_difference('JobTitle.count', -1) do
      delete panel_job_title_url(@org_panel_job_title)
    end

    assert_redirected_to panel_job_titles_url
  end
end
