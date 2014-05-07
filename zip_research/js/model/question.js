function AnnouncementModel(data) {
        var self = this;
        self.id = data.id;
        self.type = ko.observable(data.type); 
        self.weight = ko.observable(data.weight);
        self.alternatives_number = ko.observable(data.alternatives_number?data.alternatives_number:1);
        self.description = ko.observable(data.description);
        self.survey =  new SurveyModel(data.survey?data.survey:[]);
        self.inpuy_types = ko.observableArray(data.input_types?data.input_types:[]);
        self.alternatives = ko.observableArray(data.alternatives?data.alternatives:[]);
        self.formattedDescription = ko.computed(function() {
            var fdescription = replaceAll(self.description, "\\n", "<br/>");
            return fdescription;        
        });
        self.formattedType = ko.computed(function() {
           var ftype = "";
           if(self.type == 'ANNOUNCEMENT')
               ftype = 'Anuncio';
           else
               if(self.type == 'REQUEST')
                   ftype = 'Solicitud';
                   else
                       ftype = 'SOS';
           return ftype;        
        });
}