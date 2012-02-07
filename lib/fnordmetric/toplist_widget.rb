class FnordMetric::ToplistWidget < FnordMetric::Widget

  def data
    p @opts
    super.merge(
      :gauges => data_gauges,
      :autoupdate => (@opts[:autoupdate] || 0),
      :format_values => (@opts[:format_values] || 1),
      :hide_percent => (@opts[:hide_percent] || false)
    )
  end

  def data_gauges
    Hash.new.tap do |hash|
      gauges.each do |g|
        hash[g.name] = {
          :tick => g.tick,
          :title => g.title
        }
      end
    end
  end

  def has_tick?
    false
  end

end