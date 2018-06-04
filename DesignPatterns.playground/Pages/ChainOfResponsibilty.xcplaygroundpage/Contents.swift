import Foundation

enum LogLevel { case info, warning, error }

class Logger {
    var level: LogLevel
    var chain: Logger!
    
    init(_ level: LogLevel) {
        self.level = level
    }
    
    func setNext(_ next: Logger) -> Logger {
        chain = next
        return chain
    }
    
    func save(_ msg: String) {
        print("Logging... \(msg)")
    }
    
    func log(_ level: LogLevel, _ message: String) {
        if self.level == level {
            save(message)
        } else {
            chain.log(level, message)
        }
    }
}

class DBLogger: Logger {
    override func save(_ msg: String) {
        print("DBLogger... \(msg)")
    }
}
class FileLogger: Logger {
    override func save(_ msg: String) {
        print("FileLogger... \(msg)")
    }
}
class EmailLogger: Logger {
    override func save(_ msg: String) {
        print("EmailLogger... \(msg)")
    }
}

let logger = FileLogger(LogLevel.info)
let logger1 = DBLogger(LogLevel.warning)
let logger2 = EmailLogger(LogLevel.error)

logger.setNext(logger1)
logger1.setNext(logger2)


logger.log(.info, "Info: parameter missing...")
logger.log(.warning, "Warning: unauthorized access attempt...")
logger.log(.error, "Error: app crashed...")














