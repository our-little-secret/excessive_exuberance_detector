import Config

config :excessive_exuberance_detector,
       :review_request_service,
       ExcessiveExuberanceDetector.SiteScraper.ReviewRequestService

import_config "#{config_env()}.exs"
