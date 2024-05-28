# frozen_string_literal: true

require "swagger_helper"

describe "API: Example" do
  path "/api/v1/user/{example_id}/example" do
    post "API: Create example data" do
      tags "Example"
      consumes "application/json"
      produces "application/json"
      parameter name: "Accept-Language", in: :header, type: :string, example: "ja"
      parameter name: :example_id, required: true, in: :path, example: "1", description: "Prefecture ID"
      security [ bearer_auth: [] ]
      parameter name: :params, required: true, in: :body, schema: {
        type: :object,
        properties: {
          category: {type: :string, example: "観光スポット", description: "Category of the custom data"},
          name: {type: :string, example: "大通公園", description: "Name of the custom data"},
          description: {type: :string, example: "「雪まつり」の会場としても全国に知られる有名スポット",
                        description: "Description of the custom data"},
          url: {type: :string, example: "https://odori-park.jp/", description: "URL of the custom data's website"}
        }
      }

      response "200", "OK" do
        schema type: :object,
               properties: {
                example: {
                   type: :object,
                   "$ref" => "#/components/schemas/detail_example"
                 }
               }

        xit
      end

      response "400", "Bad Request" do
        schema "$ref" => "#/components/schemas/bad_request"
        xit
      end

      response "401", "Unauthorized" do
        schema "$ref" => "#/components/schemas/unauthorized"
        xit
      end

      response "404", "Not Found" do
        schema "$ref" => "#/components/schemas/not_found"
        xit
      end

      response "422", "Unprocessable Entity" do
        schema "$ref" => "#/components/schemas/unprocessable_entity"
        xit
      end

      response "500", "Server Error" do
        schema "$ref" => "#/components/schemas/server_error"
        xit
      end
    end
  end

  path "/api/v1/user/example/{id}" do
    get "API: Get detail example" do
      tags "Example"
      consumes "application/json"
      produces "application/json"
      parameter name: "Accept-Language", in: :header, type: :string, example: "ja"
      security [ bearer_auth: [] ]
      parameter name: :id, required: true, in: :path, example: "1", description: "Example ID"

      response "200", "OK" do
        schema type: :object,
               properties: {
                 prefecture: {
                   type: :object,
                   "$ref" => "#/components/schemas/detail_example"
                 }
               }

        xit
      end

      response "400", "Bad Request" do
        schema "$ref" => "#/components/schemas/bad_request"
        xit
      end

      response "404", "Not Found" do
        schema "$ref" => "#/components/schemas/not_found"
        xit
      end

      response "500", "Server Error" do
        schema "$ref" => "#/components/schemas/server_error"
      end
    end
  end

  path "/api/v1/user/example" do
    get "API: Get list all example" do
      tags "Example"
      consumes "application/json"
      produces "application/json"
      parameter name: "Accept-Language", in: :header, type: :string, example: "ja"
      security [ bearer_auth: [] ]
      parameter name: :page, in: :query, type: :integer, example: 1, description: "Page number of list items"

      response "200", "OK" do
        schema type: :object,
               properties: {
                 prefectures: {
                   type: :array,
                   items: {
                     type: :object,
                     "$ref" => "#/components/schemas/detail_example"
                   }
                 },
                 meta: {
                   type: :object,
                   properties: {
                     pagy_info: {type: :object, "$ref" => "#/components/schemas/pagy_info"}
                   }
                 }
               }

        xit
      end

      response "400", "Bad Request" do
        schema "$ref" => "#/components/schemas/bad_request"
        xit
      end

      response "500", "Server Error" do
        schema "$ref" => "#/components/schemas/server_error"
      end
    end
  end
end
