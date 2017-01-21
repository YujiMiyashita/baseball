set :output, "log/cron_log.log"

set :environment, :production

every 1.days do
  runner "Tasks::Lottery.ticket"
end
