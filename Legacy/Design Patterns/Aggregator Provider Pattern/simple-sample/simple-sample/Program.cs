
namespace ProviderAggregatorSample
{
    class Program
    {
        static void Main(string[] args)
        {
            Logger.LoggerAggregator loggerAggregator = new Logger.LoggerAggregator();

            loggerAggregator.AddLogger(new Logger.TextFileLogger());
            loggerAggregator.AddLogger(new Logger.DatabaseLogger());
            loggerAggregator.AddLogger(new Logger.DatabaseLogger());
            loggerAggregator.AddLogger(new Logger.EmailLogger());
            loggerAggregator.AddLogger(new Logger.TextFileLogger());

            loggerAggregator.DoLog();
        }
    }
}
