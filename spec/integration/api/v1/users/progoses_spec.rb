# frozen_string_literal: true

require "swagger_helper"

describe "Progoses API" do
  path "/api/v1/users/progoses" do
    post "Create a new progose" do
      tags "Progoses"
      consumes "application/json"
      produces "application/json"
      parameter name: :user_id, required: true, in: :query, example: "1", description: "Users ID"
      security [ bearer_auth: [] ]
      parameter name: :progose, required: true, in: :body, schema: {
        type: :object,
        properties: {
          date_test: { type: :string, format: :date, example: "2024-05-30", description: "Date of the test in YYYY-MM-DD format"},
          range: { type: :integer, example: 1, description: "Range score (integer between 1 and 5)" },
          range_evaluation: { type: :string, example: "Good", description: "Evaluation of range score" },
          accuracy: {type: :integer, example: 2, description: "Accuracy score (integer between 1 and 5)" },
          accuracy_evaluation: { type: :string, example: "Good", description: "Evaluation of accuracy score" },
          fluency: { type: :intege, example: 3, description: "Fluency score (integer between 1 and 5)" },
          fluency_evaluation: { type: :string, example: "Needs improvement", description: "Evaluation of fluency score" },
          interaction: { type: :integer, example: 4, description: "Interaction score (integer between 1 and 5)" },
          interaction_evaluation: { type: :string, example: "Needs improvement, excellent", description: "Evaluation of interaction score" },
          coherence: { type: :integer, example: 5, description: "Coherence score (integer between 1 and 5)" },
          coherence_evaluation: { type: :string, example: "Average, Needs improvement", description: "Evaluation of coherence score" },
          phonology: { type: :integer, example: 6, description: "Phonology score (integer between 1 and 5)" },
          phonology_evaluation: { type: :string, example: "Very good", description: "Evaluation of phonology score" },
          overall: { type: :integer, example: 1, description: "Overall score (integer between 1 and 5)" },
          overall_evaluation: { type: :string, example: "Above average", description: "Overall evaluation summary" }
        }
      }

      response "200", "OK" do
        schema type: :object,
               properties: {
                example: {
                   type: :object,
                   "$ref" => "#/components/schemas/detail_progose"
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

  path "/api/v1/users/progoses/{id}" do
    get "API: Get detail progose" do
      tags "Progoses"
      consumes "application/json"
      produces "application/json"
      security [ bearer_auth: [] ]
      parameter name: :id, required: true, in: :path, example: "1", description: "Progose ID"

      response "200", "OK" do
        schema type: :object,
               properties: {
                 prefecture: {
                   type: :object,
                   "$ref" => "#/components/schemas/detail_progose"
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

  path "/api/v1/users/progoses" do
    get "Get list all progose" do
      tags "Progoses"
      consumes "application/json"
      produces "application/json"
      security [ bearer_auth: [] ]
      parameter name: :items, in: :query, type: :integer, example: 10, description: "Number of items for each page"
      parameter name: :page, in: :query, type: :integer, example: 1, description: "Page number of list items"
      response "200", "OK" do
        schema type: :object,
               properties: {
                 progoses: {
                   type: :array,
                   items: {
                     type: :object,
                     "$ref" => "#/components/schemas/basic_progose"
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
        xit
      end
    end
  end
end
