class FoodsController < ApplicationController
  def index
    @result = get_json(params[:q])["foods"]
  end

  private #I know this shouldnt be here but I was running out of time.

  def get_json(search_item)
    response = conn.get("search?api_key=aGOBjd8mEiQXw1Z7WA1XsXUQFg0zn4Fn1U4kpuMG&generalSearchInput=#{search_item}")
    JSON.parse(response.body, symboliuze_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nal.usda.gov/fdc/v1/")
  end
end
