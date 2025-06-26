require('dotenv').config();
const mongoose = require('mongoose');

mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });

const personSchema = new mongoose.Schema({
  name: String,
  age: Number,
  favoriteFoods: [String]
});

let Person = mongoose.model('Person', personSchema);

const arrayOfPeople = [
  { name: "Alice", age: 25, favoriteFoods: ["sushi", "salad"] },
  { name: "Bob", age: 28, favoriteFoods: ["burger", "fries"] },
  { name: "Charlie", age: 22, favoriteFoods: ["tacos", "burrito"] }
];

const createAndSavePerson = (done) => {
  const newPerson = new Person({
    name: "John Doe",
    age: 30,
    favoriteFoods: ["pizza", "pasta"]
  });
  newPerson.save((err,data)=> {
    if (err) return done(err);
    return done(null, data);
  });
};

const createManyPeople = (arrayOfPeople, done) => {
  Person.create(arrayOfPeople, (err, people) => {
    if (err) return done(err);
    return done(null, people);
  });
};

const findPeopleByName = (personName, done) => {
  Person.find({ name: personName }, (err, data) => {
    if (err) return done(err);
    return done(null, data);
  });
};


const findOneByFood = (food, done) => {
  Person.findOne({ favoriteFoods : food },(err,data) => {
    if (err) return done(err);
    return done(null, data);
  });
};

const findPersonById = (personId, done) => {
  Person.findById(personId, (err, data) => {
    if (err) return done(err);
    return done(null, data);
  });
};

const findEditThenSave = (personId, done) => {
  const foodToAdd = "hamburger";

  Person.findById(personId, (err, person) => {
    if (err) return done(err);

    person.favoriteFoods.push(foodToAdd); // Add the food
    person.save((err, updatedPerson) => {
      if (err) return done(err);
      return done(null, updatedPerson); // Return the updated document
    });
  });
};


const findAndUpdate = (personName, done) => {
  const ageToSet = 20;

  Person.findOne({ name: personName }, (err, person) => {
    if (err) return done(err);
    if (!person) return done(new Error("Person not found"));

    person.age = ageToSet;

    person.save((err, updatedPerson) => {
      if (err) return done(err);
      return done(null, updatedPerson);
    });
  });
};


const removeById = (personId, done) => {
  Person.findByIdAndRemove(personId, (err, removedPerson) => {
    if (err) return done(err);
    return done(null, removedPerson);
  });
};


const removeManyPeople = (done) => {
  const nameToRemove = "Mary";

  Person.remove({ name: nameToRemove }, (err, result) => {
    if (err) return done(err);
    return done(null, result);
  });
};

const queryChain = (done) => {
  const foodToSearch = "burrito";

  Person.find({ favoriteFoods: foodToSearch }) // Step 1
    .sort({ name: 1 })                         // Step 2: Ascending sort
    .limit(2)                                  // Step 3: Limit to 2
    .select("-age")                            // Step 4: Exclude 'age' field
    .exec((err, data) => {                     // Step 5: Execute and return
      if (err) return done(err);
      return done(null, data);
    });
};


/** **Well Done !!**
/* You completed these challenges, let's go celebrate !
 */

//----- **DO NOT EDIT BELOW THIS LINE** ----------------------------------

exports.PersonModel = Person;
exports.createAndSavePerson = createAndSavePerson;
exports.findPeopleByName = findPeopleByName;
exports.findOneByFood = findOneByFood;
exports.findPersonById = findPersonById;
exports.findEditThenSave = findEditThenSave;
exports.findAndUpdate = findAndUpdate;
exports.createManyPeople = createManyPeople;
exports.removeById = removeById;
exports.removeManyPeople = removeManyPeople;
exports.queryChain = queryChain;
