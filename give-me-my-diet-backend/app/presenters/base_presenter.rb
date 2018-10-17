class BasePresenter
  def initialize
    raise NotImplementedError, "Implement this method in a child class"
  end

  def build(*representations, **keyword_representations)
    result = {}

    options = convert_representations_to_hash(representations).merge(keyword_representations)
    options.each do |method, argument_array|
      method_hash = send(method, *argument_array)
      result.merge!(method_hash)
    end
    result
  end

  private

  def convert_representations_to_hash(representations)
    nils = Array.new(representations.count)
    Hash[representations.zip(nils)]
  end
end
