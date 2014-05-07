function InputTypeModel(data) {
    var self = this;

    self.id = data.id;
    self.description = ko.observable(data.description);
    self.type = ko.observable(data.type);
    self.question =  new QuestionModel(data.question?data.question:[]);
    self.formattedDescription = ko.computed(function() {
        var fdescription = replaceAll(self.description(), "\\n", "<br/>");
        return fdescription;        
    });
}