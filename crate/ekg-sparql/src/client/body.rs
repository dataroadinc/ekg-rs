use {http_body_util::Full, hyper::body::Bytes};

/// Body type for hyper requests using Full<Bytes>.
pub type Body = Full<Bytes>;
