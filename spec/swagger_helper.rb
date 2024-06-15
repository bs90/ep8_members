# frozen_string_literal: true

require "rails_helper"

shared_components = {
  securitySchemes: {
    basic_auth: {
      type: :http,
      scheme: :basic
    },
    bearer_auth: {
      type: :http,
      scheme: :bearer,
      bearerFormat: :JWT
    }
  },
  schemas: {
    detail_example: {
      type: :object,
      properties: {
        id: {type: :integer, example: 1, description: "Custom data's ID"},
        name: {type: :string, example: "新井 遼", description: "Name of Custom data"},
        category: {type: :string, example: "観光スポット", description: "Category of the Custom data"},
        description: {type: :string, example: "「雪まつり」の会場としても全国に知られる有名スポット",
                      description: "Description of the Custom data"},
        url: {type: :string, example: "https://odori-park.jp/", description: "URL of the Custom data's website"}
      }
    },
    detail_user: {
      type: :object,
      properties: {
        user: {
          type: :object,
          properties: {
            id: {type: :integer, example: 1, description: "User's ID"},
            email: {type: :string, example: "mai.trong.dung@sun-asterisk.com", description: "User's email"},
            name_roma: {type: :string, example: "Mai Trong Dung", description: "User's name_roma"}
          }
        },
        access_token: {type: :string, example: "21478b6fdbb63717f2d9c21da9f396945263f282a68c227d4ea00b8bb21966bc", description: "User's access token"}
      }
    },
    detail_progose: {
      type: :object,
      properties: {
        date_test: { type: :string, format: :date, example: "2024-05-30", description: "Date of the test in YYYY-MM-DD format"},
        range: { type: :integer, example: 1, description: "Range score (integer between 1 and 5)" },
        range_evaluation: { type: :string, example: "Good", description: "Evaluation of range score" },
        accuracy: {type: :integer, example: 2, description: "Accuracy score (integer between 1 and 5)" },
        accuracy_evaluation: { type: :string, example: "Needs improvement", description: "Evaluation of accuracy score" },
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
    },
    basic_progose: {
      type: :object,
      properties: {
        date_test: { type: :string, format: :date, example: "2024-05-30", description: "Date of the test in YYYY-MM-DD format"},
        range: { type: :integer, example: 1, description: "Range score (integer between 1 and 5)" },
        range_evaluation: { type: :string, example: "Good", description: "Evaluation of range score" },
        accuracy: {type: :integer, example: 2, description: "Accuracy score (integer between 1 and 5)" },
        accuracy_evaluation: { type: :string, example: "Needs improvement", description: "Evaluation of accuracy score" },
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
    },
    server_error: {
      type: :object,
      properties: {
        errors: {
          type: :array,
          items: {
            type: :object,
            properties: {
              code: {type: :string, example: "B-00001", description: "Type of error"},
              message: {type: :string, example: "CDCなど外部サービスからHttpレスポンス500場合", description: "Error message"}
            }
          }
        }
      }
    },
    unauthorized: {
      type: :object,
      properties: {
        errors: {
          type: :array,
          items: {
            type: :object,
            properties: {
              code: {type: :string, example: "S-00001", description: "Type of error"},
              message: {type: :string, example: "トークン期限切れなどの場合", description: "Error message"}
            }
          }
        }
      }
    },
    bad_request: {
      type: :object,
      properties: {
        errors: {
          type: :array,
          items: {
            type: :object,
            properties: {
              code: {type: :string, example: "C-00001", description: "Type of error"},
              message: {type: :string, example: "リクエスト異常もしくは実行失敗。詳細理由はBodyのエラーコードを確認して下さい。",
                        description: "Error message"}
            }
          }
        }
      }
    },
    unprocessable_entity: {
      type: :object,
      properties: {
        errors: {
          type: :array,
          items: {
            type: :object,
            properties: {
              resource: {type: :string, example: "admin", description: "Resource has error"},
              field: {type: :string, example: "email", description: "Field has error"},
              code: {type: :string, example: "M-00001", description: "Type of invalid (error or confirm)"},
              message: {type: :string, example: "メールアドレスもしくはパスワードが正しくありません", description: "Message has error"}
            }
          }
        }
      }
    },
    not_found: {
      type: :object,
      properties: {
        errors: {
          type: :array,
          items: {
            type: :object,
            properties: {
              resource: {type: :string, example: "custom_data", description: "Resource has error"},
              code: {type: :string, example: "B-00003",
                     description: "Type of invalid (error or confirm)"},
              message: {type: :string, example: "該当する情報は見つかりませんでした。", description: "Error message"}
            }
          }
        }
      }
    },
    pagy_info: {
      type: :object,
      properties: {
        count: {type: :integer, example: 1, description: "Total record"},
        page: {type: :integer, example: 1, description: "Current page"},
        outset: {type: :integer, example: 1, description: "Initial offset"},
        items: {type: :integer, example: 1, description: "Total record per page"},
        last: {type: :integer, example: 1, description: "Last page"},
        pages: {type: :integer, example: 1, description: "Total page"},
        offset: {type: :integer, example: 1, description: "Total items skip"},
        from: {type: :integer, example: 1, description: "Index of first record in page"},
        to: {type: :integer, example: 1, description: "Index of last record in page"},
        in: {type: :integer, example: 1, description: "Total record in page"},
        prev: {type: :integer, example: 1, description: "Before page"},
        next: {type: :integer, example: 1, description: "After page"},
        limit: {type: :integer, example: 1, description: "Limit record per page"}
      }
    }
  }
}

RSpec.configure do |config|
  config.openapi_root = Rails.root.join("swagger").to_s

  config.openapi_specs = {
    "v1/swagger.yaml" => {
      openapi: "3.0.1",
      info: {
        title: "API V1",
        version: "v1"
      },
      paths: {},
      components: shared_components,
      servers: [
        {
          url: "{defaultHost}",
          variables: {
            defaultHost: {
              default: ENV.fetch("SWAGGER_DEFAULT_HOST", nil)
            }
          }
        }
      ]
    }
  }

  config.openapi_format = :yaml
end
