# frozen_string_literal: true

require "swagger_helper"

describe "API: Sessions" do
  path "/api/v1/users/sessions/sign_in" do
    post "API: Sign up" do
      tags "Sessions"
      consumes "application/json"
      produces "application/json"
      parameter name: "Accept-Language", in: :header, type: :string, example: "ja"
      security [bearer_auth: []]
      parameter name: :params, required: true, in: :body, schema: {
        type: :object,
        properties: {
          id_token: {type: :string,
                     example: "eyJhbGciOiJSUzI1NiIsImtpZCI", description: "User's id token"}
        }
      }

      response "200", "OK" do
        schema type: :object,
               properties: {
                 access_token: {
                   type: :string,
                   example: "eyJhbGciOiJIUzI1NiJ9.ywianRpIjoiMWUtNWYwN2U2YmY0MGRmIn0.vfxKoAA20L6AjBkGwSfMtFqQ",
                   description: "Access token"
                 },
                 user: {"$ref": "#/components/schemas/detail_user"}
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
end
