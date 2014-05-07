function AlternativeModel(data) {
    var self = this;

    self.id = data.id;
    self.weight = ko.observable(data.weight);
    self.description = ko.observable(data.description);
    self.chosen = ko.observable(data.chosen);
    self.question =  new QuestionModel(data.question?data.question:[]);
    self.answer_description =  ko.observable(data.answer_description);
    self.formattedDescription = ko.computed(function() {
        var fdescription = replaceAll(self.description(), "\\n", "<br/>");
        return fdescription;        
    });
    self.formattedAnsDescription = ko.computed(function() {
        var fdescription = replaceAll(self.answer_description(), "\\n", "<br/>");
        return fdescription;        
    });
}