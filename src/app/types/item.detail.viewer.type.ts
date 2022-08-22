export type ItemDetailViewerType = {
    title?: string,
    subtitle?: string,
    description_data?: ItemDetailViewerDescriptionDataType[]
}

export type ItemDetailViewerDescriptionDataType = {
    description?: string,
    attribute?: string
}