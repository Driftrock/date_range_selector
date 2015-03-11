module DateRangeSelector
  class ViewModel
    attr_reader :controller, :start_date, :end_date
    def initialize(controller)
      @controller = controller
      set_dates
    end
    delegate :session, :params, to: :controller

    def full_range
      [
        start_date.strftime(full_range_format),
        end_date.strftime(full_range_format)
      ].join(full_range_separator)
    end

    # :nocov:
    def start_time
      start_date.to_time
    end

    def end_time
      end_date.to_time
    end
    # :nocov:

    private

    def set_dates
      return dates_from_session unless changed_range?

      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
      save_to_session
    end

    def changed_range?
      params[:start_date].present?
    end

    def save_to_session
      session[:start_date] = start_date
      session[:end_date] = end_date
    end

    def dates_from_session
      @start_date = from_session(:start_date) || (Date.today - 29.days)
      @end_date = from_session(:end_date) || Date.today
    end

    def from_session(key)
      date = session[key]
      return date if date.is_a?(Date)
      Date.parse(date) rescue nil
    end

    def full_range_format
      '%B %-d, %Y'
    end

    def full_range_separator
      ' to '
    end

  end
end
