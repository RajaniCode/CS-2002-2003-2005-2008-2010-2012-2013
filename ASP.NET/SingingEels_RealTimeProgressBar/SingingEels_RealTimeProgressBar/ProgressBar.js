﻿// Register the namespace for the control.
Type.registerNamespace("SingingEels");

SingingEels.ProgressBar = function(element) { 
	SingingEels.ProgressBar.initializeBase(this, [element]);

	this._pollInterval = 0;

	this._processName = null;
}

SingingEels.ProgressBar.prototype = {
	"initialize" : function() {
		SingingEels.ProgressBar.callBaseMethod(this, "initialize");

		this._element.PollInterval = this._pollInterval;

		this._element.ProcessName= this._processName;

		var doPolling = function(element) {
			SingingEels.DoStuffWebService.GetProcessProgress(element.ProcessName, function(result) {
				element.innerHTML = result + "%";

				if (result < 100) {
					setTimeout(function(){doPolling(element);}, element.PollInterval);
				}
			});
		}

		// I'm going to add a function right to the element itself called
		// "Start". This way you can just call $get('blah').Start();
		this._element.Start = function() {
			SingingEels.DoStuffWebService.BeginProcess(this.ProcessName);

			doPolling(this);
		}
	},

	// These "get" and "set" accessors are required because I added
	// a property in the code behind file for the control with this
	// line of code: descriptor.AddProperty("pollInterval", this.PollInterval);

	"get_pollInterval" : function() {
		return this._pollInterval;
	},

	"set_pollInterval" : function(value) {
		if (this._pollInterval !== value) {
			this._pollInterval = value;
			this.raisePropertyChanged("pollInterval");
		}
	},

	"get_processName" : function() {
		return this._processName;
	},

	"set_processName" : function(value) {
		if (this._processName !== value) {
			this._processName = value;
			this.raisePropertyChanged("processName");
		}
	}
}

// Register the class as a type that inherits from Sys.UI.Control.
SingingEels.ProgressBar.registerClass("SingingEels.ProgressBar", Sys.UI.Control);

if (typeof(Sys) !== "undefined") Sys.Application.notifyScriptLoaded();

