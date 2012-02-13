class FnordMetric::Dashboard

  attr_accessor :widgets

  def initialize(options={})    
    raise "please provide a :title" unless options[:title]        
    @widgets = Array.new
    @options = options
  end

  def add_widget(w)
    @widgets << w
  end

  def title
    @options[:title]
  end

  def token
    Digest::SHA1.hexdigest(title.to_s)
  end

  def to_json
    {
      :title => title,
      :widgets => {}.tap { |wids|
        @widgets.each do |w|
          wids[w.token] = w.render
        end
      }
    }.to_json
  end
  
end