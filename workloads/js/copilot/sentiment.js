// Determine whether the sentiment of text is positive
// Use a web service
async function isPositive(text: string): Promise<boolean> {
    const response = await fetch('https://text-processing.com/api/sentiment/', {
        method: 'POST',
        body: JSON.stringify({
            text: text,
        }),
    });
    if (response.ok) {
        const json = await response.json();
        return json.label === 'pos';
    }
    throw new Error('Bad response from server');
}

// Determine whether the sentiment of text is negative
// Use a web service
async function isNegative(text: string): Promise<boolean> {
    const response = await fetch('https://text-processing.com/api/sentiment/', {
        method: 'POST',
        body: JSON.stringify({
            text: text,
        }),
    });
    if (response.ok) {
        const json = await response.json();
        return json.label === 'neg';
    }
    throw new Error('Bad response from server');
}

// Determine whether the sentiment of text is neutral
// Use a web service
async function isNeutral(text: string): Promise<boolean> {
    const response = await fetch('https://text-processing.com/api/sentiment/', {
        method: 'POST',
        body: JSON.stringify({
            text: text,
        }),
    });
    if (response.ok) {
        const json = await response.json();
        return json.label === 'neutral';
    }
    throw new Error('Bad response from server');
}

// Determine whether the sentiment of text is positive
// Use a web service
async function isPositive(text: string): Promise<boolean> {
    const response = await fetch('https://text-processing.com/api/sentiment/', {
        method: 'POST',
        body: JSON.stringify({
            text: text,
        }),
    });
    if (response.ok) {
        const json = await response.json();
        return json.label === 'pos';
    }
    throw new Error('Bad response from server');
}

//