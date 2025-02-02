const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function seed() {
    const createdCustomer = await prisma.customer.create({
        data: {
            name: 'Alice'
        }
    });

    console.log('Customer created', createdCustomer);
    
    // Add your code here
    const createdContact = await prisma.contact.create({
        data: {
            phone: '+411112222',
            email: 'alice@mail.com',
            customer: {
                create: { 
                    name: 'Alexa'
                }
            }
        }
    })
    
    console.log('Contact created', createdContact);

    const createdMovie = await prisma.movie.create({
        data: {
            title: 'Harry Potter and the Sorcerer\'s Stone',
            runtimeMins: 152,
            // screening: {
            //     create: [
            //         {startsAt: new Date('2022-01-29T15:45')},
            //         {startsAt: new Date('2022-01-31T15:45')}
            //     ]
            // }
        }
    })
    
    console.log('Movie created', createdMovie);
    
    const createdScreen = await prisma.screen.create({
        data: {
            number: 1
            // screening: {
            //     create: [
            //         {startsAt: new Date('2022-01-29T18:45')},
            //         {startsAt: new Date('2022-01-31T18:45')}
            //     ]
            // }
        }
    })

    console.log('Screen created', createdScreen);

    const createdScreening = await prisma.screening.create({
        data: {
            startsAt: new Date('2022-01-28T15:45'),
            movie: {
                connect: {
                    id: createdMovie.id
                }
            },
            screen: {
                connect: {
                    id: createdScreen.id
                }
            }
        }
    })

    console.log('Screening created', createdScreening);

    const createdTicket = await prisma.ticket.create({
        data: {
            customer: {
                create: {
                    name: 'Bravin'
                }
            },
            screening: {
                create: {
                    startsAt: new Date('2022-02-02T15:45'),
                    movie: {
                        connect: {
                            id: createdMovie.id
                        }
                    },
                    screen: {
                        connect: {
                            id: createdScreen.id
                        }
                    }
                }
            }
        }
    })

    console.log('Ticket created', createdTicket);

    // Don't edit any of the code below this line
    process.exit(0);
}

seed()
    .catch(async (error) => {
        console.error(error);
        await prisma.$disconnect();
        process.exit(1);
    })
