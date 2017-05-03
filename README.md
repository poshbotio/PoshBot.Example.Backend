
# PoshBot.Example.Backend

Example project to show the required classes and methods to create a PoshBot [backend](http://poshbot.readthedocs.io/en/latest/guides/backends/) implementation for a chat network.

Base classes are in the [PoshBot](https://github.com/poshbotio/PoshBot) project.
Your specific backend implementation will need to have a dependency on PoshBot in order for the base classes to be available to you.

In your `psm1` file, put the following at the **top** to import PoshBot (and classes) so you can derive from them. Using `Import-Module -Name PoshBot` will **NOT** work as that does not import the classes into your scope.

MyBackend.psm1
```powershell
using module PoshBot

```

## Base Classes
- Connection

Derive a new class from `Connection` to represent your connection to the chat network

- Backend

Derive a new class from `Backend` to represent the logic to connect/disconnect from the chat network, send/receive messages, and any other logic to support the specific chat network.

## Examples

See the [Slack](https://github.com/poshbotio/PoshBot/tree/master/PoshBot/Implementations/Slack) implementation in the core PoshBot project for ideas on how to implement your specific backend.
