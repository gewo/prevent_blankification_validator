require 'spec_helper'

describe ActiveModel::Validations::PreventBlankificationValidator do
  before :each do
    @validator = ActiveModel::Validations::PreventBlankificationValidator.
      new({ attributes: {} })

    @mock = mock('model')
    @mock.stub('errors').and_return []
    @mock.errors.stub('[]').and_return {}
  end

  BLANKS = [nil, '', " \n  "]

  context "when attribute_was blank" do
    BLANKS.each do |attribute_was|
      it "passes validation when attribute_was == '#{attribute_was.inspect}'" do
        @mock.stub('attribute_was').and_return attribute_was
        @mock.should_not_receive :errors
        @validator.validate_each(@mock, 'attribute', '')
      end
    end
  end

  context "when attribute_was !blank" do
    before :each do
      @mock.stub('attribute_was').and_return 'I was'
    end

    BLANKS.each do |new_value|
      it "has errors when new_value == '#{new_value.inspect}'" do
        @mock.errors.should_receive :add
        @validator.validate_each(@mock, 'attribute', '')
      end
    end

    it "passes validation when value is set to non-blank" do
      @mock.should_not_receive :errors
      @validator.validate_each(@mock, 'attribute', 'so I am')
    end
  end

  it "raises an error when dirty tracking is disabled" do
    @mock.stub('respond_to?').with('attribute_was').and_return(false)
    expect {
      @validator.validate_each(@mock, 'attribute', 'so I am')
    }.to raise_error(/have dirty tracking enabled/)
  end
end
