import Config

config :excessive_exuberance_detector,
       :review_request_service,
       ExcessiveExuberanceDetector.SiteScraper.ReviewRequestService

config :excessive_exuberance_detector,
       :io_request_service,
       ExcessiveExuberanceDetector.ConsolePrinter.IORequestService
