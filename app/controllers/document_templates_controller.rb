class DocumentTemplatesController < ApplicationController

def create
  @template = DocumentTemplate.new(template_params)
  @template.company = Company.all.first
  @template.save!
  raise
end

private

def template_params
  params.require(:document_template).permit(:title, :rich_text)
end

end
