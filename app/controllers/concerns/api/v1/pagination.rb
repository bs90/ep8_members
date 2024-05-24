# frozen_string_literal: true

module Api::V1::Pagination
  extend ActiveSupport::Concern
  include Pagy::Backend

  protected
  included do
    def paginate relation
      options = {page:, items: items(Settings.pagy.items_maxsize_default), outset: params[:outset]}
      options[:count] = params[:count] if params[:count].to_i.positive?

      pagy_info, records = pagy relation, options
      [pagy_repsonse(pagy_info), records]
    end
  end

  private

  def pagy_repsonse pagy
    pagy.instance_values.except(*Settings.pagy.instances).merge(limit: pagy.vars[:items])
  end

  def page
    @page ||= params[:page].to_i < 1 ? Settings.pagy.page_default : params[:page]
  end

  def items max_size
    item = params[:items] == "all" ? max_size : params[:items].to_i
    @items ||= item < 1 ? Settings.pagy.items_default : item
  end
end
