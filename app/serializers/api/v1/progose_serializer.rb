# frozen_string_literal: true

class Api::V1::ProgoseSerializer < BaseSerializer
  attributes :date_test, :range, :range_evaluation, :accuracy, :accuracy_evaluation, :fluency,
              :fluency_evaluation, :interaction, :interaction_evaluation, :coherence,
              :coherence_evaluation, :phonology, :phonology_evaluation, :overall, :overall_evaluation

  def attributes *attrs
    super.slice(*fields_custom)
  end

  DETAIL_INFO = %i(date_test range range_evaluation accuracy accuracy_evaluation fluency 
                    fluency_evaluation interaction interaction_evaluation coherence 
                    coherence_evaluation phonology phonology_evaluation overall overall_evaluation).freeze

  BASIC_INFO = %i(date_test range range_evaluation accuracy accuracy_evaluation fluency 
                  fluency_evaluation interaction interaction_evaluation coherence 
                  coherence_evaluation phonology phonology_evaluation overall overall_evaluation).freeze
end
