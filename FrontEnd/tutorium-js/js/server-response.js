const serverResponse = [
    {
        title: 'AAAA',
        author: 'Author',
        date: 'MM/DD/YYYY',
        image: 'https://images.unsplash.com/photo-1625633802999-cf61b6e3931f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=332&q=80',
        content: [
            {
                subheading: 'Subheading 1',
                paragraphs: [
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                ],
            },
            {
                subheading: 'Subheading 2',
                paragraphs: [
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                ],
            },
        ],
    },
    {
        title: 'BBBB',
        author: 'Author',
        date: 'MM/DD/YYYY',
        image: 'https://images.unsplash.com/photo-1625633802999-cf61b6e3931f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=332&q=80',
        content: [
            {
                subheading: 'Subheading 1',
                paragraphs: [
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                ],
            },
            {
                subheading: 'Subheading 2',
                paragraphs: [
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                ],
            },
        ],
    },
    {
        title: 'CCCC',
        author: 'Author',
        date: 'MM/DD/YYYY',
        image: 'https://images.unsplash.com/photo-1625633802999-cf61b6e3931f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=332&q=80',
        content: [
            {
                subheading: 'Subheading 1',
                paragraphs: [
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                ],
            },
            {
                subheading: 'Subheading 2',
                paragraphs: [
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, ea, error est illum ipsa iure libero nisi omnis provident quae sunt tempore ullam voluptatum! Adipisci alias iste nulla possimus vel!',
                ],
            },
        ],
    },
];

function renderBlogEntries(data) {
    const blogEntries = document.getElementById('blog-entries');
    console.log('blogEntries', blogEntries);
    console.log('serverResponse');
    console.log(serverResponse);
    console.log(JSON.stringify(data, null, 2))
    const blogEntryHTML = data.map(function (item) {
        return `
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center">${item.title}</h2>
                    <div class="d-flex justify-content-center">
                        <b>Author: ${item.author}</b>
                    </div>
                </div>
                <div class="d-flex justify-content-center col-md-6">
                    <img class="image rounded float-start" src="${item.image}" alt="super duper doll">
                </div>
                <div class="col-md-6">
                    ${item.content.map((contentItem) => {
                        return `
                            <h3>${contentItem.subheading}</h3>
                            ${contentItem.paragraphs.map((paragraph) => {
                                return `
                                    <p>
                                        ${paragraph}
                                    </p>
                                `;    
                            }).join('')}
                        `;
                    }).join('')}
                </div>
            </div>
        `;
    });

    blogEntries.innerHTML = `
        <div class="container">
            ${blogEntryHTML}
        </div>
    `;
}

renderBlogEntries(serverResponse);