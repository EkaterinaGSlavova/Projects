/* Generate random number */
function getRandomNumber(limit) {
	return Math.floor(Math.random() * limit);
}

/* Replace part of the string with another string */
String.prototype.replaceAt = function(index, character) {
	return this.substr(0, index) + character + this.substr(index + character.length);
}

/* Hide half of the quote letters */
function hideLetters(quote, character) {
	// Check if the quote is only 2 letters long
	if (quote.length == 2) {
		// Hide the first character
		return quote = quote.replaceAt(0, character);
	}
	// Hide half characters if it's longer
	else {
		for (i=0; i<quote.length/2; i++) {
			// Generate random number
			var randomNumber = getRandomNumber(quote.length);
			// Hide character if it's not already hidden/space/punctuation
			if (quote[randomNumber] != character &&
				quote[randomNumber] != ' ' &&
				quote[randomNumber] != ',' &&
				quote[randomNumber] != '.' &&
				quote[randomNumber] != '?' &&
				quote[randomNumber] != '!' &&
				quote[randomNumber] != ':' &&
				quote[randomNumber] != ';') {
				quote = quote.replaceAt(randomNumber, character);
			}
			// If it is - don't count this iteration
			else {
				i--;
			}
		}
		return quote; 
	}
}

/* Prompt user for answer */
function showQuestion(quote, author) {
	return answer = prompt('Guess this quote by ' + author + ':\n' + quote);
}

/* Guess quote in X tries in 1 minute */
function guessQuote(tries) {

	// Get random quote and hide characters
	var randomQuote = greatQuotes[getRandomNumber(greatQuotes.length)];
	var hiddenQuote = hideLetters(randomQuote.quote, '_');

	// Get time
	var startTime = new Date();
	var startMinutes = startTime.getMinutes();
	var startSeconds = startTime.getSeconds();

	// Announce game start
	alert('Guess the quote in '+tries+' attempts in under 1 minute.');

	while (tries > 0) {

		// Show the question
		var answer = showQuestion(hiddenQuote, randomQuote.author);

		// Indicate this attempt
		tries--;

		// Create new date object to get the time after the answer is submitted
		var currentTime = new Date();
		var currentMinutes = currentTime.getMinutes();
		var currentSeconds = currentTime.getSeconds();

		if (startMinutes == currentTime.getMinutes()) {

			if (answer == randomQuote.quote) {
				alert('Congratulations, you guessed the quote!');
				break;
			}
			else if (tries > 0) {
				alert('Oops, try again! You have ' + tries + ' tries left.');
			}
			else {
				alert('Sorry, no more tries left - game over.');
				break;
			}
		}
		else if ((startSeconds - currentTime.getSeconds()) < 0) {
			alert('Sorry, your time has run out - game over.');
			break;
		}

	}
}

/* The array with quotes */
var greatQuotes = [
	{
		quote: 'If you cannot do great things, do small things in a great way.',
		author: 'Napoleon Hill'   
	},
	{
		quote: 'A man is great by deeds, not by birth.', 
		author: 'Chanakya'
	},
	{
		quote: 'To love another person is to see the face of God.',  
		author: 'Victor Hugo'
	},
	{
		quote: 'Everything you can imagine is real',
		author: 'Pablo Picasso'
	},
	{
		quote: 'Women are made to be loved, not understood.',
		author: 'Oscar Wilde'
	}
];

// Start the game and choose how many tries the player will have
guessQuote(3);