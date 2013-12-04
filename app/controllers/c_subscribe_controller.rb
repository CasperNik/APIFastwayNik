class CSubscribeController < ApplicationController

  def show
    @sub = Suscribe.all
  end

  def create
    @new_sub = Suscribe.new
    @new_sub.label = params[:label]
    @new_sub.link = params[:link]
    if params[:countofrecords].nil?
      @new_sub.countofrecords= 0
    else
      @new_sub.countofrecords = params[:countofrecords]
    end
    if (@new_sub.save)
      @out = {'out'=>'true'}
      render json: @out
      logger.debug @new_sub
    else
      @out = {'out'=>'false'}
      render json: @out
    end
  end
  def delete
      Suscribe.find(params[:id]).destroy
    redirect_to c_subscribe_index_path
  end

  def changes
    @ch = 0
    subs = Suscribe.all
    subs.each do |sub|
      newcount = data(sub.label).count
      if(sub.countofrecords < newcount)
       # отправляем оповещение и сохраняем новое количество записей

        sub.countofrecords = newcount
        sub.save
      end
    end
  end
  def send_toast subscriptionUri

  end
  def delete_old
    now = Time.now

  end

  def data (label)
    require 'json'
    require 'net/http'

    resp = Net::HTTP.get_response(URI('http://api.fastway.org/v3/tracktrace/detail/'+label+'?api_key=d1c1f025ab7f1d87862146beae54135f'))
    data1 = resp.body
    result= ActiveSupport::JSON.decode(data1)
    result = result['result']['Scans']
    return result
  end

end
