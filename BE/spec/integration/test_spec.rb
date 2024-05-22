# frozen_string_literal: true

require "swagger_helper"

describe "Health check API" do
  path "/test" do
    get "check api" do
      tags "Test Check"
      produces "application/json", "application/xml"

      response 200, "Server is healthy" do
        schema type: :object

        run_test!
      end
    end
  end
end
