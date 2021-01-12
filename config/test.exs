import Config

config :excessive_exuberance_detector,
       :review_request_service,
       ExcessiveExuberanceDetector.SiteScraper.ReviewRequestServiceMock

config :excessive_exuberance_detector,
       :io_request_service,
       ExcessiveExuberanceDetector.ConsolePrinter.IORequestServiceMock
