# ライブラリー読み込み
require 'capybara/rspec'
require 'selenium-webdriver'
require 'pry'

# RSpecにCapybaraのDSLを設定
RSpec.configure do |config|
  config.include Capybara::DSL
end

# Capybaraにseleniumを使うように設定
Capybara.default_driver = :selenium
Capybara.app_host = 'https://github.com/'


describe "GitHub" do
  before do
    visit '/'
  end

  it "トップページが表示されること確認" do
    expect(page).to have_content('Build software better, together.')
  end

  it "ログイン画面が表示できること確認" do
    click_link "Sign in"
    expect(current_path).to eq '/login'
  end

  it "ログインできること確認" do
    click_link "Sign in"

    # テキストフィールドに入力し、ボタンをクリック(id, name, value属性などを指定できる)
    fill_in 'login_field', with: 'GitHubのユーザ名'
    fill_in 'password',    with: 'GitHubのパスワード'
    click_button "Sign in"

    expect(current_path).to eq '/'
  end
end